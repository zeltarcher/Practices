using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise5
{
    class ComplexNumber
    {
        private int real, imaginary;
        public int Real {
            get
            {
                return real;    
            }
            set
            {
                real = value;
            } 
        }
        public int Imaginary
        {
            get
            {
                return imaginary;
            }
            set
            {
                imaginary = value;
            }
        }

        public ComplexNumber(int a, int b)
        {
            real = a;
            imaginary = b;
        }
        public string ToString()
        {
            return "("+real+","+imaginary+")";
        }

        public double GetMagnitude()
        {
            return Math.Sqrt(real*real + imaginary*imaginary);
        }

        public void Add(ComplexNumber num1)
        {
            real += num1.real;
            imaginary += num1.imaginary;
        }
    }
}
