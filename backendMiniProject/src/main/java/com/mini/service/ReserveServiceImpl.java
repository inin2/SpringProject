package com.mini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.ReserveMapper;
import com.mini.vo.CakeVO;
import com.mini.vo.ReserveVO;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper reservemapper;

	/* 케이크 상세 정보 */
	@Override
	public CakeVO cakeDetailGet(int cakeId) {
		return reservemapper.cakeDetailGet(cakeId);
	}

	/* 케이크 예약 */
	@Override
	public int reserveCake(ReserveVO reserve) {
		return reservemapper.reserveCake(reserve);
	}

	/* 케이크 예약 목록 */
	@Override
	public List<ReserveVO> reserveCakeGet(String memberId) {
		List<ReserveVO> reserve = reservemapper.reserveCakeGet(memberId);

		return reserve;
	}

	/* 케이크 예약 취소 */
	@Override
	public int reserveCancle(int reserveId) {
		return reservemapper.reserveCancle(reserveId);
	}

}
