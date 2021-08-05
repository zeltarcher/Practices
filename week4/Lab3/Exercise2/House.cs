using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class House
    {
        protected int area;
        protected Door door;

        public House(int area)
        {
            this.area = area;
            door = new Door();
        }
        public int Area
        {
            get { return area; }
            set { area = value; }
        }
        public Door Door
        {
            get { return door; }
            set { door = value; }
        }

        public virtual void ShowData()
        {
            Console.WriteLine("I am a house, my area is {0} m2.", area);

        }
    }        
}
