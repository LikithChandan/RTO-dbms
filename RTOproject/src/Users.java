import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Users 
{

	JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args)
	{
		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					Users window = new Users();
					window.frame.setVisible(true);
				} 
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Users()
	{
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() 
	{
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JTextArea textArea = new JTextArea();
		textArea.setBounds(0, 0, 434, 176);
		frame.getContentPane().add(textArea);
		
		JButton btnAddUser = new JButton("Add User");
		btnAddUser.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0)
			{
				Add_User usr=new Add_User();
				usr.frame.setVisible(true);
			}
		});
		btnAddUser.setBounds(69, 207, 89, 23);
		frame.getContentPane().add(btnAddUser);
		
		JButton btnDl = new JButton("DL");
		btnDl.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0) 
			{
				Driving_License usr=new Driving_License();
				usr.frame.setVisible(true);
			}
		});
		btnDl.setBounds(170, 207, 89, 23);
		frame.getContentPane().add(btnDl);
		
		JButton btnLl = new JButton("LL");
		btnLl.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0)
			{
				Learning_License usr=new Learning_License();
				usr.frame.setVisible(true);
			}
		});
		btnLl.setBounds(271, 207, 89, 23);
		frame.getContentPane().add(btnLl);
		
		JButton btnPrev = new JButton("prev");
		btnPrev.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0) 
			{
				frame.setVisible(false);
			}
		});
		btnPrev.setBounds(0, 230, 59, 23);
		frame.getContentPane().add(btnPrev);
	}
}
