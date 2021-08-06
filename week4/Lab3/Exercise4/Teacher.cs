using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class Teacher:Person
    {
        private string subject;
        public void Explain()
        {
            Console.WriteLine("Explanation begins...");
        }
    }
}
