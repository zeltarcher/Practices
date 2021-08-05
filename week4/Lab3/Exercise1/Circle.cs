using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise1
{
    class Circle : Shape1
    {
        public override float Area()
        {
            return Convert.ToSingle(3.14) * r * r;
        }

        public override float Circumference()
        {
            return Convert.ToSingle(3.14) * 2 * r;
        }

        public void Create()
        {
            Console.WriteLine("Create a Circle");
            Console.Write("Enter radius: ");
            r = Convert.ToSingle(Console.ReadLine());
        }
    }
}
