package com.zhangqichang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhangqichang.dao.ElectDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.UserSingle;

public class ElectServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("adminList".equals(action))
			doAdminList(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}	
	
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		System.out.println(whoid);
		List electlist=null;
		ElectDao electDao=new ElectDao();		
		try {
			electlist=electDao.getListElect(whoid);
			
		} catch (SQLException e) {
			System.out.println("��̨����ȡ�Ƽ�����ʧ�ܣ�");
			e.printStackTrace();			
		}		
		request.setAttribute("electlist",electlist);

		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("insertPage"));
		String message="";
		String forward=getServletContext().getInitParameter("adminTemp");
		HttpSession session=request.getSession();
		String type=request.getParameter("type");

		if("add".equals(type)){										//如果是单击＂上传视频＂提交按钮触发的请求
			message=validateElect(request);							//���б?��֤
			if("".equals(message)){									//�?��֤�ɹ�
				int whoId=((UserSingle)session.getAttribute("logoner")).getId();
				String title=request.getParameter("title");
				String src=request.getParameter("src");
				String time=Change.dateTimeChange(new Date());
				Object[] params={whoId,title,src,time};

				int i=0;
				try {
					ElectDao electDao=new ElectDao();
					i=electDao.insert(params);
				} catch (SQLException e) {
					i=-1;
					e.printStackTrace();
				}
				//调用DAO类向数据表中添加视频信息
				if(i<=0)
					message="<li>保存视频信息时失败！</li>";
				else{
					message="<li>视频上传成功！</li>";
					forward="/my/admin/elect?action=adminList";
				}
			}
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		
		int i=0;
		try {
			ElectDao electDao=new ElectDao();
			i=electDao.delete(id);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>ɾ��ʧ�ܣ�<a href='javascript:window.history.go(-1)'>�����ء�</a></li>";
			forward=getServletContext().getInitParameter("messagePage");
		}
		else{
			message="<li>ɾ��ɹ���</li>";
			forward="/my/admin/elect?action=adminList";
		}
		request.setAttribute("message",message);

		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateElect(HttpServletRequest request){
		String message="";
		String title=request.getParameter("title");//获取输入的视频标题
		String src=request.getParameter("src");
		if(title==null||title.equals(""))
			message="<li>������ <b>���±���</b>��";
		if(src==null||src.equals(""))
			message+="<li>������ <b>�������ӵ�ַ</b>��";
		return message;
	}
}
