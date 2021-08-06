using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise3
{
    class AccountManagement
    {
        HouseholdAccounts[] acc = new HouseholdAccounts[10000];
        public HouseholdAccounts CreateSingleAcc()
        {
            HouseholdAccounts singleAcc = new HouseholdAccounts();
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
            singleAcc.Date = new DateTime(y, m, d);
            //Console.WriteLine("Date entered: "+acc.Date.ToString("yyyy/MM/dd"));
            do
            {
                Console.Write("Enter Description");
                singleAcc.Description = Console.ReadLine();
                if (singleAcc.Description == null || singleAcc.Description==" ")
                {
                    Console.WriteLine("Description cannot be null, press any key to re-enter");
                    Console.ReadKey();
                }
            } while (singleAcc.Description == null);
            singleAcc.Description.Trim();
            singleAcc.Description.ToLower();
            singleAcc.Description[0].ToString().ToUpper();

            Console.Write("Enter Category: ");
            singleAcc.Category = Console.ReadLine();

            amount:
            Console.WriteLine("Is this an income(i) or an expense(e)?");
            Console.WriteLine("Enter i or e: ");
            string check = Console.ReadLine().Trim();
            if (check.Contains("i"))
            {
                Console.Write("Enter Amount: ");
                singleAcc.Amount = Convert.ToDecimal(Console.ReadLine());
            }
            else if(check.Contains("e"))
            {
                Console.Write("Enter Amount: ");
                singleAcc.Amount = -Convert.ToDecimal(Console.ReadLine());
            }
            else
            {
                Console.WriteLine("Must enter either 'i' or 'e',Press any key to re-enter... ");
                Console.ReadKey();
                goto amount;
            }
            return singleAcc;
        }

        public void ShowSingle(HouseholdAccounts acc)
        {
            Console.Write("Date: "+acc.Date.ToString("yyyy/MM/dd"));
            Console.Write("\tDescription: "+acc.Description);
            Console.Write("\tCategory: "+acc.Category);
            Console.Write("\tAmount= "+acc.Amount+"\n");
        }



        public void Display()
        {
            int iAcc = 0;
            int choice;
            bool check = false;
            do
            {
                Console.Clear();
                Console.WriteLine("==================== Expense =======================");
                Console.WriteLine("Enter 1 for Add a new expense");
                Console.WriteLine("Enter 2 for show all data");
                Console.WriteLine("Enter 3 for show all expenses of a certain category and date range");
                Console.WriteLine("Enter 4 for search cost containing a certain text");
                Console.WriteLine("Enter 5 to modify a tab");
                Console.WriteLine("Enter 6 to delete a tab");
                Console.WriteLine("Enter 0 to Exit");
                Console.Write("Your choice = ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        acc[iAcc] = CreateSingleAcc();
                        iAcc += 1;
                        break;
                    case 2:
                        for (int i = 0; i < acc.Length; i++)
                        {
                            if (acc[i] != null)
                            {
                                Console.Write("No." + i);
                                ShowSingle(acc[i]);
                            }
                        }
                        break;
                    case 3:
                        check = false;
                        Console.Write("Enter category you want to search: ");
                        string catSearch = Console.ReadLine();
                        Console.Write("Enter the start date(yyyyMMdd): ");
                        DateTime startDate = DateTime.ParseExact(Console.ReadLine(),"yyyyMMdd",CultureInfo.InvariantCulture);
                        Console.Write("Enter the end date(yyyyMMdd): ");
                        DateTime endDate = DateTime.ParseExact(Console.ReadLine(), "yyyyMMdd", CultureInfo.InvariantCulture);

                        for (int i = 0; i < acc.Length; i++)
                        {
                            if (acc[i] != null)
                            {
                                if(acc[i].Category.Contains(catSearch) && (acc[i].Date > startDate || acc[i].Date < endDate))
                                {
                                    Console.Write("No." + i);
                                    ShowSingle(acc[i]);
                                    check = true;
                                }
                            }
                        }

                        if (!check)
                        {
                            Console.WriteLine("Not found");
                            Console.ReadKey();
                        }
                        break;
                    case 4:
                        check = false;
                        Console.Write("Enter any text you want to search: ");
                        string s = Console.ReadLine();
                        for (int i = 0; i < acc.Length; i++)
                        {
                            if (acc[i] != null)
                            {
                                if (acc[i].Category.ToLower().Contains(s.ToLower()) || acc[i].Description.ToLower().Contains(s.ToLower()))
                                {
                                    Console.Write("No." + i);
                                    ShowSingle(acc[i]);
                                    check = true;
                                }
                            }
                            if (!check)
                            {
                                Console.WriteLine("Not found");
                                Console.ReadKey();
                            }
                        }
                        break;
                    case 5:
                        Console.Write("Enter the No. to modify= ");
                        int id = Convert.ToInt32(Console.ReadLine());
                        acc[id] = CreateSingleAcc();
                        Console.WriteLine("Updated");
                        break;
                    case 6:
                        Console.Write("Enter the No. you want to delete= ");
                        id = Convert.ToInt32(Console.ReadLine());
                        List<HouseholdAccounts> temp = new List<HouseholdAccounts>(acc);
                        temp.RemoveAt(id);
                        acc = temp.ToArray();
                        Console.WriteLine("Deleted");
                        break;
                    case 0:
                        Console.WriteLine("Thank you for using our service!!!");
                        break;
                    default:
                        Console.WriteLine("Some error has been occured");
                        break;
                }
                Console.ReadKey();
            } while (choice != 0);
        }

        public void Run()
        {
            Display();
        }
    }
}
