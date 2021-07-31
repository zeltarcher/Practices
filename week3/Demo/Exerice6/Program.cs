using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exerice6
{
    class Program
    {
        static void Main(string[] args)
        {
            int r;
            Console.WriteLine("Enter number of row: ");
            r = Convert.ToInt32(Console.ReadLine());

            //first half
            for (int i = 0; i <= r; i++)
            {
                for (int j = 1; j <= r - i; j++)
                    Console.Write(" ");
                for (int j = 1; j <= 2 * i - 1; j++)
                    Console.Write("*");
                Console.Write("\n");
            }

            //second half
            for (int i = r - 1; i >= 1; i--)
            {
                for (int j = 1; j <= r - i; j++)
                    Console.Write(" ");
                for (int j = 1; j <= 2 * i - 1; j++)
                    Console.Write("*");
                Console.Write("\n");
            }

            Console.ReadKey();
        }    
    }
}
