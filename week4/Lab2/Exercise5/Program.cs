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
            Box box1 = new Box();
            Box box2 = new Box();
            Box box3 = new Box();
            Console.WriteLine("Create box 1");
            box1.CreateBox();
            Console.WriteLine("\nCreate box 2");
            box2.CreateBox();
            box3 = box1 + box2;

            Console.WriteLine("\nVolume of Box 1: "+box1.getVolume());
            Console.WriteLine("Volume of Box 2: " + box2.getVolume());
            Console.WriteLine("Volume of Box 3: " + box3.getVolume());
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}
