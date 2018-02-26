package cn.uestc.ssm.utils;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

public class VerifyCode {
	private int width=70;
	private int height = 30;
	private Random r=new Random();
	private String[] fontNames={"����","���Ŀ���","����","΢���ź�","����_GB2312"};
	private String codes="23456789abcdefghijkmnpqrstuvwxyzABCDEFGHIJKLMNPQRTUVWXYZ";
	private Color bgColor=new Color(255,255,255);//��ɫ����
	private String text;//���ڱ���ͼƬ���ı�
	
	//�������ɫ
	private Color randomColor(){
		int red=r.nextInt(150);//150��ʾ���ɫ�н����Ե�����
		int green=r.nextInt(150);
		int blue=r.nextInt(150);
		return new Color(red,green,blue);
	}
	//�������������
	private Font randomFont(){
		int index=r.nextInt(fontNames.length);//
		String fontName=fontNames[index];
		int style=r.nextInt(4);//�����������ʽ ��0(����ʽ)  1(б��)  2(����)  3(б��+����)  
		int size=r.nextInt(5)+24;//��������ֺţ�24-28
		return new Font(fontName,style,size);
	}
	
	//���������һλ��֤��
	private char randomChar() {
		int index=r.nextInt(codes.length());
		return codes.charAt(index);
	}
	//��������
		private BufferedImage createImage() {
			BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
			Graphics2D g2=(Graphics2D)image.getGraphics();//�õ�����
			g2.setColor(this.bgColor);
			g2.fillRect(0, 0, width, height);
			return image;
		}
		//��������
		private void drawLine(BufferedImage image) {
			int num =3;
			Graphics2D g2=(Graphics2D)image.getGraphics();
			for(int i =0;i<num;i++){
				int x1=r.nextInt(width);
				int y1=r.nextInt(height);
				int x2=r.nextInt(width);
				int y2=r.nextInt(height);
				g2.setStroke(new BasicStroke(1.5F));
				g2.setColor(Color.BLUE);
				g2.drawLine(x1, y1, x2, y2);
			}
		}
		
		public String getText(){
			return text;
		}	
	//������������õ���֤��
	public BufferedImage getImage(){
		BufferedImage image=createImage();
		Graphics2D g2=(Graphics2D)image.getGraphics();
		StringBuilder sb=new StringBuilder();
		//��ͼƬ�л�4���ַ�
		for (int i=0;i<4;i++){
			String s=randomChar()+"";//�������һ���ַ���������һ���ո�
			sb.append(s); //����
			float x=i*1.0F*width/4;//���õ�ǰ�ַ���x������
			g2.setFont(randomFont());
			g2.setColor(randomColor());
			g2.drawString(s, x, height-5);
		}
		this.text=sb.toString();//�����ɵ��ַ���������this.text
		drawLine(image);//��Ӹ�����
		return image;
	
	}

		//����ͼƬ��ָ���������
	public static void output (BufferedImage image,OutputStream out) throws IOException{
		ImageIO.write(image,"JPEG",out);
	}
}
