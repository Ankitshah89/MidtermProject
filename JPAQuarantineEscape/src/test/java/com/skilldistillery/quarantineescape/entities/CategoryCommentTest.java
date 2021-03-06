package com.skilldistillery.quarantineescape.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CategoryCommentTest {

	static EntityManagerFactory emf;
	private EntityManager em;
	private CategoryComment categoryComment;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("QuarantineEscapePU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		categoryComment = em.find(CategoryComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		categoryComment = null;
	}

	@Test
	void test() {

		assertNotNull(categoryComment);
		assertEquals(1,categoryComment.getId());

	}
}
