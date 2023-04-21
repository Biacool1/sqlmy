using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ShaimurzinSQLApp
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            this.PasswordField.AutoSize = false;
            this.PasswordField.Size = new Size(this.PasswordField.Size.Width, 33);
            LoginField.Text = "Введите логин";
            PasswordField.UseSystemPasswordChar = false;
            PasswordField.Text = "Введите пароль";
            LoginField.ForeColor = Color.Gray;
            PasswordField.ForeColor = Color.Gray;
        }
        private void Close_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Close_MouseEnter(object sender, EventArgs e)
        {
            Close.ForeColor = Color.LightBlue;
        }

        private void Close_MouseLeave(object sender, EventArgs e)
        {
            Close.ForeColor = Color.Black;
        }
        private void MainPanel_MouseMove(object sender, MouseEventArgs e)
        {
            if(e.Button == MouseButtons.Left)
            {
                this.Left += e.X - lastPoint.X;
                this.Top += e.Y - lastPoint.Y;
            }
        }
        private void MainPanel_MouseDown_1(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            String loginUser = LoginField.Text;
            String passUser = PasswordField.Text;
            DB db =  new DB();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();
            MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login`= @uL AND `pass`=@uP ", db.GetConnection());
            command.Parameters.Add("@uL", MySqlDbType.VarChar).Value=loginUser;
            command.Parameters.Add("@uP", MySqlDbType.VarChar).Value = passUser;
            adapter.SelectCommand = command; 
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            { this.Hide();
            MainForm mainForm = new MainForm();
            mainForm.Show();
            }
            else
                MessageBox.Show("Неверный логин или пароль");
        }

        private void RegisterLable_Click(object sender, EventArgs e)
        {
            this.Hide();
            RegisterForm registerform = new RegisterForm();
            registerform.Show();
        }

        private void LoginField_Enter(object sender, EventArgs e)
        {
            if (LoginField.Text == "Введите логин")
                LoginField.Text = "";
            LoginField.ForeColor = Color.Black;
        }

        private void LoginField_Leave(object sender, EventArgs e)
        {
             if (LoginField.Text == "")
                LoginField.Text = "Введите логин";
            LoginField.ForeColor = Color.Gray;
        }
       private void PasswordField_Enter(object sender, EventArgs e)
        {
            PasswordField.Text = "";
            PasswordField.ForeColor = Color.Black;
            PasswordField.UseSystemPasswordChar = true;
           
        }

        private void PasswordField_Leave(object sender, EventArgs e)
        {
            if (PasswordField.Text == "")
            {
                PasswordField.Text = "Введите пароль";
                PasswordField.ForeColor = Color.Gray;
            }
        }
        Point lastPoint;
        private void label1_MouseMove(object sender, MouseEventArgs e)
        {

            if (e.Button == MouseButtons.Left)
            {
                this.Left += e.X - lastPoint.X;
                this.Top += e.Y - lastPoint.Y;
            }
        }

        private void label1_MouseDown(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }
    }
} 
