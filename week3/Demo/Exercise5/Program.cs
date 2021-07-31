using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise5
{
    class Program
    {
        static void Main(string[] args)
        {
            int r;
            bool check=true;
            Console.WriteLine("Enter the number of rows: ");
            r= Convert.ToInt32( Console.ReadLine());

            for (int i = 0; i <= r; i++)
            {
                for (int j = 0; j < i; j++)
                {
                    if (check)
                    {
                        check = false;
                        Console.Write("1");
                    }
                    else
                    {
                        check = true;
                        Console.Write("0");
                    } 
                }
                Console.WriteLine();
            }

            Console.ReadKey();
        }
    }
}
