package com.mycompany.lifill_mini_web.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Function {
	
	private int fnno;
	private String prdcode;
	private String fnval;

}
