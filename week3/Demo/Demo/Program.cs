using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo
{
    public class Student
    {
        string name, address;
        int mobile;

        public void GetData()
        {
            Console.Write("Enter your name: ");
            name = Console.ReadLine();

            Console.WriteLine("Enter your address: ");
            address = Console.ReadLine();

            Console.WriteLine("Enter your mobile: ");
            mobile = Convert.ToInt32( Console.ReadLine());
        }

        public void DisplayData()
        {
            Console.WriteLine("Student name: "+ name);
            Console.WriteLine("Student address: "+ address);
            Console.WriteLine("Student mobile: "+mobile);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Student s1 = new Student();
            s1.GetData();
            s1.DisplayData();
            Console.ReadKey();
        }
    }
}
