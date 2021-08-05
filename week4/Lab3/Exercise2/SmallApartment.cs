using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class SmallApartment : House
    {
        public SmallApartment() : base(50)
        {

        }

        public override void ShowData()
        {
            Console.WriteLine("I am an apartment, my area is " + area + " m2");

        }
    }
}
