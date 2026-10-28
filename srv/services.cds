using {sap.capire.incidents as my} from '../db/schema';

/**
 * Service used by support personnel,
 * i.e. the incidents' processors.
 */
service ProcessorService {

    @odata.draft.enabled
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

// Support Role
annotate ProcessorService with @(requires: 'support');


/**
 * Service used by administrators
 * to manage customers and incidents.
 */
service AdminService {

    entity Customers as projection on my.Customers;

    entity Incidents as projection on my.Incidents;
}

// Admin Role
annotate AdminService with @(requires: 'admin');