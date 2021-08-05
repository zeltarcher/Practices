using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4
{
    class Solution
    {
        private int[,] arr;
        private int col, row;
        public void Set2DArray()
        {
            Console.Write("Enter number of columns: ");
            col = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter number of rows: ");
            row = Convert.ToInt32(Console.ReadLine());

            arr = new int [row,col];
            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < col; j++)
                {
                    Console.Write("Enter Array["+i+","+ j+"]= ");
                    arr[i, j] = Convert.ToInt32(Console.ReadLine())
                        ;
                }
            }
        }

        public void Print2DArray()
        {
            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < col; j++)
                {
                    Console.Write(arr[i, j]+" ");
                }
                Console.WriteLine();
            }
        }

        public void print1DArray()
        {
            int rowFloor = 0, colFloor = 0,//min
                rowCeiling = row, colCeiling = col,//max
                count = 0, maxLoop = row*col;//main loop control
            bool isGoRight = true;//check go right or left
                
            while(count<maxLoop)
            {
                if (isGoRight)//go right then go down
                {
                    for (int j = colFloor; j < colCeiling; j++)
                    {
                        Console.Write(arr[rowFloor, j]+" ");
                    }
                    
                    rowFloor += 1;

                    for (int i = rowFloor; i < rowCeiling; i++)
                    {
                        Console.Write(arr[i, colCeiling-1] + " ");
                    }

                    colCeiling -= 1;
                    isGoRight = false;
                }
                else //go left then go up
                {
                    for (int j = colCeiling-1; j >= colFloor; j--)
                    {
                        Console.Write(arr[rowCeiling-1, j] + " ");
                    }

                    rowCeiling -= 1;

                    for (int i = rowCeiling-1; i >= rowFloor; i--)
                    {
                        Console.Write(arr[i, colFloor] + " ");
                    }

                    colFloor += 1;
                    isGoRight = true;
                }
                count += 1;
            }
        }

        public void Run()
        {
            Set2DArray();
            Print2DArray();
            print1DArray();
        }
    }
}
