using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise1
{
    class Rectangle : Shape1
    {
        public override float Area()
        {
            return l * b;
        }

        public override float Circumference()
        {
            return 2 * (l + b);
        }

        public void Create()
        {
            Console.WriteLine("Create a Rectangle");
            Console.Write("Enter length: ");
            l = Convert.ToSingle(Console.ReadLine());

            Console.Write("Enter breadth: ");
            b = Convert.ToSingle(Console.ReadLine());
        }

    }
}
