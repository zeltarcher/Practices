using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class StudentAndTeacherTest
    {
        static void Main(string[] args)
        {
            Person p = new Person();
            Student s = new Student();
            Teacher t = new Teacher();

            p.Say("Hello");

            s.SetAge(21);
            s.Say("Hello");
            s.ShowAge();

            t.SetAge(30);
            t.Say("Hello");
            t.Explain();

            Console.ReadKey();
        }
    }
}
