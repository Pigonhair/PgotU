package com.parking.member.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.member.dao.MemberMapper;
import com.parking.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberMapper memberMapper;
	
	//회원가입하는 메서드
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("**********impl 들어옴********");
		vo.setMem_num(memberMapper.selectMem_num());// 시퀀스 적용하기
		System.out.println("InsertMEmber : vo.getNUM : " + vo.getMem_num());
		memberMapper.insertMember(vo); // member테이블 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		memberMapper.insertMember_detail(vo); // 일반회원 테이블에 저장
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		memberMapper.insertMember_car(vo);//
		System.out.println("InsertMEmber :  vo.getToken()" + vo.getMem_token());
		
	}
	
	@Override
	public MemberVO getMemberByID(String mem_id) {
		MemberVO v =memberMapper.getMemberByID(mem_id);
		return v;
	}
	
	//mem_id로 memberVo가져오기
	@Override
	public MemberVO isMemberID(String mem_id) {
		MemberVO v =memberMapper.isMemberID(mem_id);
		return v;
	}

	//mem_token로 memberVo가져오기
	@Override
	public MemberVO getMemberbytoken(String mem_token) {
		return memberMapper.getMemberbytoken(mem_token);
	}
	
	//멤버 정보 업데이트하기
	@Override
	public void updateMember(MemberVO vo) {
		memberMapper.updateMember(vo);
		System.out.println("회원정보 업데이트 완료");
		memberMapper.updateMember_detail(vo);
		System.out.println("member_detail 업데이트 완료");
		memberMapper.updateMember_car(vo);
		System.out.println("member_car 업데이트 완료");
	}


	//로그인
	@Override
	public MemberVO CheckMemberIdPwd(MemberVO vo) {
		MemberVO memberVO = memberMapper.CheckMemberIdPwd(vo);
		return memberVO;
	}
	
	//회원데이터삭제 및 탈퇴 
	@Override
	public void deletemember(int mem_num) {
		memberMapper.deletemember_car(mem_num);
		memberMapper.deletemember_detail(mem_num);
		memberMapper.deletereservation(mem_num);
		memberMapper.deletereview(mem_num);
		memberMapper.deleteparking(mem_num);
		memberMapper.deletemember(mem_num);
	}
	
	@Override
	public int getMemnumBytoken(String mem_token) {
		int mem_num = memberMapper.getMemnumBytoken(mem_token);
		return mem_num;
	}
	
	//전체회원리스트가져오기
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberlist = memberMapper.getMemberList();
		return memberlist;
	}
	
	@Override
	public MemberVO isMemberId(String mem_id) {
		MemberVO memberVO = memberMapper.isMemberId(mem_id);
		return memberVO;
	}
	
}
