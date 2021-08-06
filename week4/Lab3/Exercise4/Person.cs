using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class Person
    {
        protected int age;
        public void SetAge(int n)
        {
            age = n;
        }

        public void Say(string s)
        {
            Console.WriteLine(s);
        }
    }
}
