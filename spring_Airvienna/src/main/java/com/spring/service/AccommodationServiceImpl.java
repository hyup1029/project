package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.AccommodationVO;
import com.spring.domain.Criteria;
import com.spring.mapper.AccommodationMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccommodationServiceImpl implements AccommodationService {

	@Inject
	private AccommodationMapper mapper;

	@Override
	public List<AccommodationVO> optionE(Criteria ct) {
		return mapper.optionE(ct);
	}

	@Override
	public List<AccommodationVO> optionRe(Criteria ct) {
		log.warn("으아아아아ㅏ아앙");
		return mapper.optionRe(ct);
	}

	@Override
	public List<AccommodationVO> optionM(Criteria ct) {
		return mapper.optionM(ct);
	}

	@Override
	public List<AccommodationVO> optionT(Criteria ct) {
		return mapper.optionT(ct);
	}

	@Override
	public List<AccommodationVO> optionRT(Criteria ct) {
		return mapper.optionRT(ct);
	}

	@Override
	public List<AccommodationVO> optionTM(Criteria ct) {
		return mapper.optionTM(ct);
	}

	@Override
	public List<AccommodationVO> optionRM(Criteria ct) {
		return mapper.optionRM(ct);
	}

	@Override
	public List<AccommodationVO> optionRTM(Criteria ct) {
		return mapper.optionRTM(ct);
	}
	
	
}
