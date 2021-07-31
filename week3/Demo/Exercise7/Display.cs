using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise7
{
    class Display
    {
        AccountManager accManager = new AccountManager();
        public void Menu()
        {
            byte choice;
            do
            {
                Console.Clear();
                Console.WriteLine("********** Welcome to ATM Services **********");
                Console.WriteLine("1. Check balance");
                Console.WriteLine("2. Withdraw Cash");
                Console.WriteLine("3. Deposit Cash");
                Console.WriteLine("4. Quit");
                Console.WriteLine("*********************************************");
                Console.Write("Enter your choise: ");
                choice = Convert.ToByte(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        accManager.PrintBalance();                       
                        break;
                    case 2:
                        Console.Write("Enter the amount to withdraw: ");
                        double w = Convert.ToDouble(Console.ReadLine());
                        if (w < accManager.CheckBalance())
                        {
                            accManager.Withdraw(w);
                            accManager.PrintBalance();
                        }
                        else
                        {
                            Console.WriteLine("The withdrawal amount must not exceed the balance!!!");
                            accManager.PrintBalance();
                            Console.WriteLine("The amount you want to withdraw: " + w);
                        }
                        Console.WriteLine();
                        break;
                    case 3:
                        Console.Write("Enter the amount you want to deposit: ");
                        double d = Convert.ToDouble(Console.ReadLine());
                        accManager.Deposit(d);
                        accManager.PrintBalance();
                        Console.WriteLine();
                        break;
                    case 4:
                        Console.WriteLine("Thank you for using our service! Press any key to exit...");
                        Console.WriteLine();
                        Console.ReadKey();
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("An error has been occured, please contact customer service...");
                        Console.WriteLine("Or try again by press anykey...");
                        Console.WriteLine();
                        break;
                }
                Console.WriteLine("Press any key to back to menu...");
                Console.ReadKey();
            }
            while (choice != 4);
            Console.ReadKey();
        }

        public bool PinCheck()
        {           
            Console.Write("Create your pin number: ");
            int p = Convert.ToInt32(Console.ReadLine());
            accManager.SetPin(p);
            do
            {
                Console.Write("Enter your pin number: ");
                p = Convert.ToInt32(Console.ReadLine());
                switch (accManager.CheckPin(p))
                {
                    case true:
                        Console.WriteLine("Pin enter Succeed!!!");
                        break;
                    case false:
                        bool falseChecker=true;
                        Console.WriteLine("Wrong pin!!!");
                        do
                        {
                            Console.Write("Do you want to try it again?(y/n): ");
                            string ans = Console.ReadLine();
                            if (ans == "y")
                            {
                                break;
                            }
                            if (ans == "n")
                            {
                                falseChecker = false;
                                return false;
                            }
                            else
                            {
                                falseChecker = false;
                                Console.WriteLine("wrong input");
                                break;
                            }
                        } while (falseChecker);
                        break;
                    default:
                        break;
                }
            } while (!accManager.CheckPin(p));
            return accManager.CheckPin(p);
        }
    }
}
