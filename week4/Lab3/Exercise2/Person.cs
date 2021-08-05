using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise2
{
    class Person
    {
        protected string name;
        protected House house;

        public Person()
        {
            name = "Juan";
            house = new House(150);
        }
        public Person(string name, House house)
        {
            this.name = name;
            this.house = house;
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public House House
        {
            get { return house; }
            set { house = value; }
        }

        public void ShowData()
        {
            Console.WriteLine("My name is {0}.", name);
            house.ShowData();
            house.Door.ShowData();
        }

    }
}
