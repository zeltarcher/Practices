using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class Solution
    {
        private int[] A;
        private int length=0;
        public void SetArray()
        {
            do
            {
                Console.Write("Enter the length of array: ");
                length = Convert.ToInt32(Console.ReadLine());
                if(length < 1 || length > 1000)
                    Console.WriteLine("Length invalid, please enter again!");
            } while (length < 1 || length > 1000);

            A = new int[length];
            for (int i = 0; i < length; i++)
            {
                Console.Write("Enter the item: A["+i+"] : ");
                A[i] = Convert.ToInt32(Console.ReadLine());
            }
        }
        public void solution()
        {
            Dictionary<int, int> count = new Dictionary<int, int>();
            for (int i = 0; i < length; i++)
            {
                if (count.ContainsKey(A[i]))
                {
                    count[A[i]] += 1;
                }
                else
                {
                    count.Add(A[i], 1);
                }
            }
            foreach (var item in count)
            {
                Console.WriteLine("item: "+item.Key+", "+item.Value+" times");
            }

            var top2 = count.OrderByDescending(pair => pair.Value).Take(1);

            Console.Write("Top 2 most often: ");
            foreach (var item in top2)
            {
                Console.Write(item.Key+" ");
            }
        }

        public void Run()
        {
            SetArray();
            solution();
        }
    }
}
