This repository explores Principal Component Analysis (PCA) applied to the Heptathlon dataset from the HSAUR (Handbook of Statistical Analysis Using R) package. The dataset contains performance measures of athletes in a women’s heptathlon competition, covering seven track and field events.

The PCA analysis uncovered meaningful patterns in the heptathlon data, which have real-world applications:
- Finding Talented Athletes: Instead of focusing on a single event, coaches can identify athletes with strong overall abilities such as speed or throwing power, which matter across multiple events.
- Designing Training Programs: The first principal component highlights the balance between speed and strength. Coaches can tailor training — e.g., a fast athlete may need more strength training, while a strong athlete may benefit from speed-focused sessions.
- Predicting Performance: Since the first two components explain about 80.8% of the variation, they can be used to estimate an athlete’s overall performance without analyzing every event separately.
- Choosing Events to Focus On: Some events, such as hurdles and long jump, are closely related because they rely on similar skills. Training in one of these events may also enhance performance in the other.

The repository includes R code, results, and visualizations, making it a resource for learning PCA in the context of sports analytics and multivariate statistics.
