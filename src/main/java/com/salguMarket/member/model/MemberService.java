package com.salguMarket.member.model;

import java.sql.SQLException;
import java.util.List;

public class MemberService {
	//���̵� �ߺ�Ȯ�� & ã��
	public static final int USABLE_ID=1; //��밡��(�ű�)
	public static final int UNUSABLE_ID=2;//���Ұ�(�̹� ����)
	//�г��� �ߺ�Ȯ��
	public static final int USABLE_NICKNAME=1;  
	public static final int UNUSABLE_NICKNAME=2; 
	//�α��� üũ���� ����ϴ� ���(checkLogin,)
	public static final int LOGIN_OK=1;//����
	public static final int DISAGREE_PWD=2;//��� ����ġ
	public static final int NONE_ID=3;//���̵� ����

	private MemberDAO memDao;

	public MemberService() {
		memDao=new MemberDAO();
	}
	//ȸ������
	public int insertMember(MemberVO memVo) throws SQLException {
		return memDao.insertMember(memVo);
	}
	//��üȸ����ȸ
	public List<MemberVO> selectAll() throws SQLException {
		return memDao.selectAll();
		
	}
	//ȸ�����̵�� ��ȸ
	public MemberVO selectById(String mId) throws SQLException {
		return memDao.selectById(mId);
	}
	//�г������� ��ȸ
	public MemberVO selectByNick(String mNick) throws SQLException {
		return memDao.selectByNick(mNick);
	}
	//ȸ����������
	public int deleteMember(String mId) throws SQLException {
		return memDao.deleteMember(mId);
	}
	//ȸ����������
	public int updateMember(MemberVO memVo) throws SQLException {
		return memDao.updateMember(memVo);
	}
	//���̵� �ߺ��˻�, ���ȸ��Ȯ��
	public int duplicateId(String mId) throws SQLException {
		return memDao.duplicateId(mId);
	}
	//�г��� �ߺ��˻�, ���ȸ��Ȯ��
	public int duplicateNick(String mNick) throws SQLException {
		return memDao.duplicateNick(mNick);
	}
	//�α��� üũ
	public int checkLogin(String mId, String mPwd) throws SQLException {
		return memDao.checkLogin(mId, mPwd);//1,2,3
	}


}
