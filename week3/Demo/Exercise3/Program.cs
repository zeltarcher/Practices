using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise3
{
    class Program
    {
        static void Main(string[] args)
        {
            string s1;
            Console.Write("Enter your string: ");
            s1 = Console.ReadLine();

            char[] charArray = s1.ToCharArray();
            Array.Reverse(charArray);
            s1 = new string(charArray);

            Console.WriteLine("Reversed string: "+s1);

            Console.ReadKey();
        }
    }
}
