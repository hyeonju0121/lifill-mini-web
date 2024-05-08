package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Ingredient;

@Mapper
public interface IngredientDao {

	public int igdinsert(Ingredient ingredient);

}
