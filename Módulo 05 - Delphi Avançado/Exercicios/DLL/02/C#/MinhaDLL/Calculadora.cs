using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using RGiesecke.DllExport;

namespace MinhaDLL
{
    [Guid("9D4F7D19-545C-4B57-B087-7FF07B48B28F")]
    [ComVisible(true)]
    public class Calculadora
    {
        [DllExport]
        public static double Somar(double A, double B)
        {
            return A + B;
        }

    }
}
