package com.in.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.mapper.BoardMapper;
import com.in.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;

	/* 게시판 목록 */
	@Override
	public List<BoardVO> boardList() {
		return boardmapper.boardList();
	}

	/* 게시판 등록 */
	@Override
	public void boardEnroll(BoardVO board) {
		boardmapper.boardEnroll(board);
	}

	/* 게시판 조회 */
	@Override
	public BoardVO boardPage(int bno) {
		return boardmapper.boardPage(bno);
	}

	/* 게시판 수정 */
	@Override
	public int boardModify(BoardVO board) {
		return boardmapper.boardModify(board);
	}

	/* 게시판 삭제 */
	@Override
	public int boardDelete(int bno) {
		return boardmapper.boardDelete(bno);
	}

	/* 조회수 증가 */
	@Override
	public void viewsUpdate(int bno) {
		boardmapper.viewsUpdate(bno);
	}

	/* 페이징 */
//	@Override
//	public List<BoardVO> boardPaging(Criteria cri) {
//		return boardmapper.boardPaging(cri);
//	}

	/* 게시물 총 갯수 */
//	@Override
//	public int getTotal() {
//		return boardmapper.getTotal();
//	}

}
