package com.in.service;

import java.util.List;

import com.in.vo.BoardVO;

public interface BoardService {

	/* 게시판 목록 */
	public List<BoardVO> boardList();

	/* 게시판 등록 */
	public void boardEnroll(BoardVO board);

	/* 게시판 조회 */
	public BoardVO boardPage(int bno);

	/* 게시판 수정 */
	public int boardModify(BoardVO board);

	/* 게시판 삭제 */
	public int boardDelete(int bno);
	
	/* 조회수 증가 */
	public void viewsUpdate(int bno);
	
	/* 페이징 */
//	public List<BoardVO> boardPaging(Criteria cri);
	
	/* 게시판 총 갯수 */
//    public int getTotal();
}
