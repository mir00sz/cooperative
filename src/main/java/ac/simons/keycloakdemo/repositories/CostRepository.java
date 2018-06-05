package ac.simons.keycloakdemo.repositories;

import ac.simons.keycloakdemo.model.Cost;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface CostRepository extends CrudRepository<Cost,Long> {

    List<Cost> findByValue(BigDecimal value);
}
