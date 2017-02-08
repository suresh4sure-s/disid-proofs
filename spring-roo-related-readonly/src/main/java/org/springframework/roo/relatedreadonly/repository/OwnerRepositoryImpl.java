package org.springframework.roo.relatedreadonly.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import org.springframework.roo.relatedreadonly.domain.Owner;

/**
 * = OwnerRepositoryImpl
 *
 * TODO Auto-generated class documentation
 *
 */ 
@RooJpaRepositoryCustomImpl(repository = OwnerRepositoryCustom.class)
public class OwnerRepositoryImpl extends QueryDslRepositorySupportExt<Owner> {

    /**
     * TODO Auto-generated constructor documentation
     */
    OwnerRepositoryImpl() {
        super(Owner.class);
    }
}