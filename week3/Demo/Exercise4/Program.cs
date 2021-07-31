using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class Program
    {
        static void Main(string[] args)
        {
            int min, max, sum=0, temp, digit;
            Console.WriteLine("Enter min: ");
            min = Convert.ToInt32( Console.ReadLine());

            Console.WriteLine("Enter max: ");
            max = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("===================================================================");
            for(int i = min; i <= max; i++)
            {
                temp = i;
                while (temp > 0)
                {
                    digit = temp % 10;
                    sum = sum + (digit*digit*digit);
                    temp = temp / 10;
                }
                if (i == sum)
                {
                    Console.WriteLine(i);
                }
                sum = 0;
            }
            Console.ReadKey();
        }
    }
}
