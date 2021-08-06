using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class Student:Person
    {
        public void ShowAge()
        {
            Console.WriteLine("My age is: "+age+" years old");
        }

        public void GoToClass()
        {
            Console.WriteLine("I'm going to class...");
        }
    }
}
