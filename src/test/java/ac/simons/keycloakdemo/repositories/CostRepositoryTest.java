package ac.simons.keycloakdemo.repositories;

import ac.simons.keycloakdemo.model.Cost;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.math.BigDecimal;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class CostRepositoryTest {


    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private CostRepository costRepository;


    @Test
    public void shouldFindOneByValue() {
        BigDecimal costValue = new BigDecimal("2.0");
        Cost cost = Cost.builder().value(costValue).build();
        entityManager.persist(cost);
        List<Cost> costsRetireved = costRepository.findByValue(costValue);
        assertEquals(new BigDecimal("2.0"), costsRetireved.stream().findFirst().map(Cost::getValue).orElse(null));
    }

    @Test
    public void shouldFindTwoByValue(){
        BigDecimal costValue = new BigDecimal("2.0");
        Cost cost = Cost.builder().id(0).value(costValue).build();
        Cost cost1 = Cost.builder().id(1).value(costValue).build();
        entityManager.persist(cost);
        entityManager.persist(cost1);
        List<Cost> costsRetireved = costRepository.findByValue(costValue);

        assertThat(costsRetireved, hasSize(2));
        assertEquals(new BigDecimal("2.0"), costsRetireved.stream().findFirst().map(Cost::getValue).orElse(null));
    }


}