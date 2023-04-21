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
    public partial class RegisterForm : Form
    {
        public RegisterForm()
        {
            InitializeComponent();
            userNameField.Text = "Введите имя";
            userSurnameField.Text = "Введите фамилию";
            LoginField.Text = "Введите логин";
            PasswordField.Text = "Введите пароль";
            userSurnameField.ForeColor = Color.Gray;
            userNameField.ForeColor = Color.Gray;
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
        Point lastPoint;
        private void MainPanel_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.Left += e.X - lastPoint.X;
                this.Top += e.Y - lastPoint.Y;
            }
        }
    
        private void MainPanel_MouseDown(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }

        private void userNameField_Enter(object sender, EventArgs e)
        {
            if (userNameField.Text == "Введите имя")
            userNameField.Text = "";
            userNameField.ForeColor = Color.Black;
        }
        private void userNameField_Leave(object sender, EventArgs e)
        {
            if (userNameField.Text == "")
            userNameField.Text = "Введите имя";
            userNameField.ForeColor = Color.Gray;
        }
          private void userSurnameField_Enter_1(object sender, EventArgs e)
        {
            if (userSurnameField.Text == "Введите фамилию")
            userSurnameField.Text = "";
            userSurnameField.ForeColor = Color.Black;
        }
        private void userSurnameField_Leave(object sender, EventArgs e)
        {
            if (userSurnameField.Text == "")
            userSurnameField.Text = "Введите фамилию";
            userSurnameField.ForeColor = Color.Gray;
        }

        private void buttonRegister_Click(object sender, EventArgs e)
        {
            if (userNameField.Text == "Введите имя")
            {
                MessageBox.Show("Введите имя");
               return;
            }
            if (userSurnameField.Text == "Введите фамилию")
            {
                MessageBox.Show("Введите фамилию");
                return;
            }
            if (PasswordField.Text == "Введите пароль")
            {
                MessageBox.Show("Введите пароль");
                return;
            }
            if (LoginField.Text == "Введите логин")
            {
                MessageBox.Show("Введите логин");
                return;
            }

            if (isUserExists())
                return;

            DB db = new DB();
            MySqlCommand command = new MySqlCommand("INSERT INTO `users` (`login`, `pass`, `name`, `lastname`) VALUES (@login, @pass, @name, @surname);",db.GetConnection());
            command.Parameters.Add("@login", MySqlDbType.VarChar).Value = LoginField.Text;
            command.Parameters.Add("@pass", MySqlDbType.VarChar).Value = PasswordField.Text;
            command.Parameters.Add("@name", MySqlDbType.VarChar).Value = userNameField.Text;
            command.Parameters.Add("@surname", MySqlDbType.VarChar).Value = userSurnameField.Text;
            
            db.OpenConnection();
            if (command.ExecuteNonQuery() == 1)
                MessageBox.Show("Аккаунт был создан");
            else
                MessageBox.Show("Аккаунт не был создан");

            db.CloseConnection();
        }

        private bool isUserExists()
        {
            String loginUser = LoginField.Text;
            String passUser = PasswordField.Text;
            DB db = new DB();
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter();
            MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login`= @uL", db.GetConnection());
            command.Parameters.Add("@uL", MySqlDbType.VarChar).Value = LoginField.Text;
            adapter.SelectCommand = command;
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                MessageBox.Show("Логин занят");
                return true;
            }

            else
            return false;
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoginForm loginForm = new LoginForm();
            loginForm.Show();
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
            if (PasswordField.Text == "Введите пароль")
                PasswordField.Text = "";
            PasswordField.ForeColor = Color.Black;
            PasswordField.UseSystemPasswordChar = true;
        }

        private void PasswordField_Leave(object sender, EventArgs e)
        {
            if (PasswordField.Text == "")
                PasswordField.Text = "Введите пароль";
            PasswordField.ForeColor = Color.Gray;
        }

        private void label1_MouseMove(object sender, MouseEventArgs e)
        {
            {

                if (e.Button == MouseButtons.Left)
                {
                    this.Left += e.X - lastPoint.X;
                    this.Top += e.Y - lastPoint.Y;
                }
            }
        }
        private void label1_MouseDown(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }
    }
}

