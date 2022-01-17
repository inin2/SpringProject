package com.in.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.in.service.BoardService;
import com.in.vo.BoardVO;

// http://localhost:8090/board/list
// http://localhost:8090/board/enroll

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardservice;

	/* 게시판 목록 페이지 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardListGET(Model model) {
		log.info("게시판 목록 페이지");

		model.addAttribute("bList", boardservice.boardList());

		log.info("list");

		return "list";
	}

	/* 게시판 등록 페이지 */
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public String boardEnrollGET() {
		log.info("게시판 등록 페이지");

		return "enroll";
	}

	/* 게시판 등록 */
	@RequestMapping(value = "/enroll.do", method = RequestMethod.POST)
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("게시판 등록");

		boardservice.boardEnroll(board);

		log.info("게시판 등록 완료");

		rttr.addFlashAttribute("result", "enroll");

		return "redirect:/board/list";
	}

	/* 게시판 조회 페이지 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String boardPageGET(int bno, Model model) {
		log.info("게시판 조회 페이지");
		
		// 조회수 증가
		boardservice.viewsUpdate(bno);

		model.addAttribute("detailInfo", boardservice.boardPage(bno));

		return "detail";
	}

	/* 게시판 수정 페이지 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String boardModifyGET(int bno, Model model) {
		log.info("게시판 수정 페이지");

		model.addAttribute("detailInfo", boardservice.boardPage(bno));

		return "modify";
	}

	/* 게시판 수정 */
//	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
//    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
//		log.info("게시판 수정");
//		
//		boardservice.boardModify(board);
//		
//		log.info("게시판 수정 완료");
//        
//        rttr.addFlashAttribute("result", "modify");
//        
//        return "redirect:/board/list";
//    }
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardModifyPOST(BoardVO board) throws Exception {
		log.info("게시판 수정");
		
		log.info(board.toString());

		if (boardservice.boardModify(board) == 1) {
			log.info(board.toString());
			return "Y";
		} else {
			log.info(board.toString());
			return "N";
		}
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String boardDeletePost(int bno, RedirectAttributes rttr) {
		log.info("게시판 삭제");

		boardservice.boardDelete(bno);

		rttr.addFlashAttribute("result", "delete");

		return "redirect:/board/list";
	}

	/* 게시판 목록 페이지 + 페이징 */
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String boardListGET(Model model, Criteria cri) {
//
//		log.info("게시판 목록 페이지");
//
//		model.addAttribute("bList", boardservice.boardPaging(cri));
//
//		int total = boardservice.getTotal();
//
//		PageMakeVO pageMake = new PageMakeVO(cri, total);
//		
//		model.addAttribute("pageMake", pageMake);
//		
//		log.info(pageMake.toString());
//
//		return "list";
//	}

}
