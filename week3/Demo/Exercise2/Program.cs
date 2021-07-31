using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class Program
    {
        static void Main(string[] args)
        {
            Arithmetic calc = new Arithmetic();
            Console.WriteLine("Enter a = ");
            double a = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Enter b = ");
            double b = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine();
            Console.WriteLine("Addition = "+calc.Addition(a,b));
            Console.WriteLine("Subtraction = " + calc.Subtraction(a, b));
            Console.WriteLine("Division = " + calc.Division(a, b));
            Console.WriteLine("Multiplication = " + calc.Multiplication(a, b));

            Console.ReadKey();
        }
    }
}
