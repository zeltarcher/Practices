using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise7
{
    public class Account
    {
        private int pin;
        private double balance;
        public int Pin
        {
            get
            {
                return pin;
            }
            set
            {
                pin = value;
            }
        }
        public double Balance { get { return balance; }  set { balance = value; } }
    }
}
