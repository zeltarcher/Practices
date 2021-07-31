using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise7
{
    class AccountManager
    {
        Account acc = new Account();
        public void SetPin(int a)
        {
            acc.Pin = a;
        }

        public bool CheckPin(int a)
        {
            return (a==acc.Pin)?true:false;
        }

        public double CheckBalance()
        {
            return acc.Balance;
        }

        public void Withdraw(double a)
        {
            acc.Balance -= a;
        }

        public void Deposit(double a)
        {
            acc.Balance += a;
        }

        public void PrintBalance()
        {
            Console.WriteLine("Current Balance: "+acc.Balance);
        }
    }
}
