package tiger.api.test.runner.reviewsession;

import com.intuit.karate.junit5.Karate;

public class TestRunnerReviewSession {
	@Karate.Test
	public Karate runTest() {
		return Karate.run("classpath:ReviewFeature")
				.tags("Smoke");
	}

}
