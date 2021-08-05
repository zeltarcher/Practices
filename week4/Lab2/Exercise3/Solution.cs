using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise3
{
    class Solution
    {
        private int min, max;
        public void SetRange()
        {
            bool check = true;
            do
            {
                Console.Write("Enter min: ");
                min = Convert.ToInt32(Console.ReadLine());
                if (min > -10000 && min < 10000)
                    check = false;
                else
                {
                    check = true;
                    Console.WriteLine("Min value is invalid,please enter again...");
                    Console.ReadKey();
                }
                    
            } while (check);
            check = true;
            do
            {
                Console.Write("Enter max: ");
                max = Convert.ToInt32(Console.ReadLine());
                if (max > -10000 && max < 10000 && max > min)
                {
                    check = false;
                }
                else
                {
                    check = true;
                    Console.WriteLine("Max value is invalid,please enter again...");
                    Console.ReadKey();
                }
            } while (check);
            
        }

        public int PerfectSquareCount(int a,int b)
        {
            int count = 0;
            for (int i = a; i < b; i++)
            {

                if (Math.Sqrt(i) % 1 == 0)
                {
                    count += 1;
                    Console.Write(i+" ");
                }
            }
            return count;
        }

        public void Run()
        {
            SetRange();
            Console.WriteLine("Total perfect square is: "+ PerfectSquareCount(min, max));
            
        }
    }
}
