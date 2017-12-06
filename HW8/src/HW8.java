import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*; 

import java.io.*; 

public class HW8 extends JFrame
{
	protected JButton buttonSave;
	protected JButton buttonReset;
	
	protected JTextField redField;
	protected JTextField greenField;
	protected JTextField blueField;
	
	protected JList colorList;
		 
	public static void main (String[] args) throws IOException
	{
		//System.out.println ("Hello World!");
		
		new HW8 ("Color Picker");
		
		ColorObject testColor = new ColorObject ("Blurple", 69, 420, 52);
				
		System.out.println (testColor);
		
		//myObject.ReadInColors ();
		FileInputStream stream = new FileInputStream ("Colors.txt");
		InputStreamReader reader = new InputStreamReader (stream);
		StreamTokenizer tokens = new StreamTokenizer (reader); 
		
		String readName;
		int readR;
		int readG;
		int readB;
		
		ColorObject colors[] = new ColorObject[11];
		
		int index = 0;
		
		while (tokens.nextToken() != tokens.TT_EOF)
		{
			readName = (String) tokens.sval;
			tokens.nextToken();
			
			readR = (int) tokens.nval;
			tokens.nextToken();
			
			readG = (int) tokens.nval;
			tokens.nextToken();
			
			readB = (int) tokens.nval;
			
			colors[index] = new ColorObject (readName, readR, readG, readB);
			
			index++;
			
		}

		stream.close();
		
		
		for (int i = 0; i < 11; i++)
		{
			System.out.println (colors[i]);
			
		}
		
	}
	
	public HW8 (String title)
	{
		
				 
	}
	
	private class ActionHandler implements ActionListener
	{
		public void actionPerformed(ActionEvent e)
		{
			
		}
	}
	
	private class WindowDestroyer extends WindowAdapter
	{
		public void windowClosing(WindowEvent e)
		{
			System.exit(0);
			
		}
	} 
	
	private class ListHandler implements ListSelectionListener
	{
		public void valueChanged(ListSelectionEvent e)
		{
			
		}
	} 

}
