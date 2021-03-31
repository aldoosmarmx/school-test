package mx.dev.blank.dao;

import java.util.List;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import mx.dev.blank.entity.User;
import org.springframework.validation.annotation.Validated;

@Validated
public interface UserDAO {

  User getById(@NotBlank String id);

  User getByName(@NotBlank String name);

  List<User> getPaginated(@Min(0) int currentPos, @Min(1) int size);

  List<User> getByNameCoincidence(@NotBlank String coincidence);

  List<String> getSortedNames();

  void update(@NotNull User user);

  void updateNameById(@NotBlank String name, @NotBlank String id);
}
