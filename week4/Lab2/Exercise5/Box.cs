using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise5
{
    class Box
    {
        private double length, breadth, height;

        public double getVolume()
        {
            return length * breadth * height;
        }

        public void SetLength(double len)
        {
            length = len;
        }

        public void SetBreadth(double bre)
        {
            breadth = bre;
        }

        public void Setheight(double hei)
        {
            height = hei;
        }

        public void CreateBox()
        {
            Console.Write("Enter height: ");
            Setheight(Convert.ToDouble(Console.ReadLine()));

            Console.Write("Enter breadth: ");
            SetBreadth(Convert.ToDouble(Console.ReadLine()));

            Console.Write("Enter length: ");
            SetLength(Convert.ToDouble(Console.ReadLine()));
        }

        public static Box operator+(Box a, Box b)
        {
            Box box = new Box();

            box.length = a.length + b.length;
            box.breadth = a.breadth + b.breadth;
            box.height = a.height + b.height;

            return box;
        }
    }
}
