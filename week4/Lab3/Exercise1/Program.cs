using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise1
{
    class Program
    {
        static void Main(string[] args)
        {
            Circle c1 = new Circle();
            Rectangle rec1 = new Rectangle();

            rec1.Create();
            Calculate(rec1);

            c1.Create();
            Calculate(c1);

            Console.ReadKey();
        }

        public static void Calculate(Shape1 S)
        {

            Console.WriteLine("Area : {0}", S.Area());
            Console.WriteLine("Circumference : {0}", S.Circumference());

        }
    }
}
