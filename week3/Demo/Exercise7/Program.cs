using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise7
{
    class Program
    {
        static void Main(string[] args)
        {
            Display dis = new Display();
            if (dis.PinCheck())
            {
                dis.Menu();
            }
        }
    }
}
