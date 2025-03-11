# Turns off the display by calling the Windows API

Add-Type -TypeDefinition '
using System;
using System.Runtime.InteropServices;

namespace Utilities
{
	public static class Display
	{
		[DllImport("user32.dll", CharSet = CharSet.Auto)]
		private static extern IntPtr SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
		
		public static void PowerOff()
		{
			SendMessage(
				(IntPtr)0xffff, // HWND_BROADCAST
				0x0112,         // UINT		-> WM_SYSCOMMAND
				(IntPtr)0xf170, // WPARAM	-> SC_MONITORPOWER
				(IntPtr)0x0002  // LPARAM	-> POWER_OFF
			);
		}
	}
}
'

[Utilities.Display]::PowerOff()
