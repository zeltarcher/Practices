using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise5
{
    class ComplexTest
    {
        static void Main(string[] args)
        {
            bool debug = false;

            ComplexNumber number = new ComplexNumber(5, 2);
            Console.WriteLine("Number is: " + number.ToString());

            number.Imaginary = -3;
            Console.WriteLine("Number is: " + number.ToString());

            Console.Write("Magnitude is: ");
            Console.WriteLine(number.GetMagnitude());

            ComplexNumber number2 = new ComplexNumber(-1, 1);
            number.Add(number2);
            Console.Write("After adding: ");
            Console.WriteLine(number.ToString());

            if (debug)
                Console.ReadLine();
            Console.ReadKey();

        }
    }
}
