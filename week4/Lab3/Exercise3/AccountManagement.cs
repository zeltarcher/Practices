using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise3
{
    class AccountManagement
    {
        HouseholdAccounts acc = new HouseholdAccounts();
        public void CreateAcc()
        {
            bool isLoop = true;
            do
            {
                year:
                Console.Write("Enter year: ");
                int y = Convert.ToInt32( Console.ReadLine());
                if (y < 1000 || y > 3000)
                {
                    Console.WriteLine("Year must beween 1000 and 3000, Pres any key to re-enter...");
                    Console.ReadKey();
                    goto year;
                }
                month:
                Console.Write("Enter month: ");
                int m = Convert.ToInt32( Console.ReadLine());
                if (m < 1 || m > 12)
                {
                    Console.WriteLine("Month must between 1 and 12, Press anykey to re-enter...");
                    Console.ReadKey();
                    goto month;
                }
                day:
                Console.Write("Enter day: ");
                int d = Convert.ToInt32( Console.ReadLine());
                if (d < 1 || d > 31)
                {
                    Console.WriteLine("Day must between 1 and 31, Press any key to re-enter...");
                    Console.ReadKey();
                    goto day;
                }
                acc.Date = new DateTime(y, m, d);
                Console.WriteLine("Date entered"+acc.Date);
            } while (isLoop);

            Console.Write("Enter Description");
            acc.Description = Console.ReadLine();

            Console.Write("Enter Category: ");
            acc.Category = Console.ReadLine();

            Console.Write("Enter Amount: ");
            acc.Amount = Convert.ToDecimal(Console.ReadLine());
        }

        public void Run()
        {
            CreateAcc();
        }
    }
}
