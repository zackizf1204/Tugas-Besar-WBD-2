
package Service;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the Service package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _SaveOrderResponse_QNAME = new QName("http://Service/", "saveOrderResponse");
    private final static QName _UpdateTabel_QNAME = new QName("http://Service/", "update_tabel");
    private final static QName _SearchHistory_QNAME = new QName("http://Service/", "search_history");
    private final static QName _RetrieveDriverRating_QNAME = new QName("http://Service/", "retrieveDriverRating");
    private final static QName _ValidateResponse_QNAME = new QName("http://Service/", "validateResponse");
    private final static QName _RetrieveDrivers_QNAME = new QName("http://Service/", "retrieveDrivers");
    private final static QName _UpdateLocations_QNAME = new QName("http://Service/", "update_locations");
    private final static QName _RetrieveDriverRatingResponse_QNAME = new QName("http://Service/", "retrieveDriverRatingResponse");
    private final static QName _SaveOrder_QNAME = new QName("http://Service/", "saveOrder");
    private final static QName _ProfileData_QNAME = new QName("http://Service/", "profileData");
    private final static QName _RetrieveDriversResponse_QNAME = new QName("http://Service/", "retrieveDriversResponse");
    private final static QName _SearchCustomerName_QNAME = new QName("http://Service/", "search_customer_name");
    private final static QName _SearchCustomerNameResponse_QNAME = new QName("http://Service/", "search_customer_nameResponse");
    private final static QName _Validate_QNAME = new QName("http://Service/", "validate");
    private final static QName _UpdateTabelResponse_QNAME = new QName("http://Service/", "update_tabelResponse");
    private final static QName _ProfileDataResponse_QNAME = new QName("http://Service/", "profileDataResponse");
    private final static QName _UpdateLocationsResponse_QNAME = new QName("http://Service/", "update_locationsResponse");
    private final static QName _SearchHistoryResponse_QNAME = new QName("http://Service/", "search_historyResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: Service
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SearchHistory }
     * 
     */
    public SearchHistory createSearchHistory() {
        return new SearchHistory();
    }

    /**
     * Create an instance of {@link UpdateTabel }
     * 
     */
    public UpdateTabel createUpdateTabel() {
        return new UpdateTabel();
    }

    /**
     * Create an instance of {@link ValidateResponse }
     * 
     */
    public ValidateResponse createValidateResponse() {
        return new ValidateResponse();
    }

    /**
     * Create an instance of {@link RetrieveDriverRating }
     * 
     */
    public RetrieveDriverRating createRetrieveDriverRating() {
        return new RetrieveDriverRating();
    }

    /**
     * Create an instance of {@link RetrieveDriverRatingResponse }
     * 
     */
    public RetrieveDriverRatingResponse createRetrieveDriverRatingResponse() {
        return new RetrieveDriverRatingResponse();
    }

    /**
     * Create an instance of {@link SaveOrder }
     * 
     */
    public SaveOrder createSaveOrder() {
        return new SaveOrder();
    }

    /**
     * Create an instance of {@link RetrieveDrivers }
     * 
     */
    public RetrieveDrivers createRetrieveDrivers() {
        return new RetrieveDrivers();
    }

    /**
     * Create an instance of {@link UpdateLocations }
     * 
     */
    public UpdateLocations createUpdateLocations() {
        return new UpdateLocations();
    }

    /**
     * Create an instance of {@link SaveOrderResponse }
     * 
     */
    public SaveOrderResponse createSaveOrderResponse() {
        return new SaveOrderResponse();
    }

    /**
     * Create an instance of {@link UpdateTabelResponse }
     * 
     */
    public UpdateTabelResponse createUpdateTabelResponse() {
        return new UpdateTabelResponse();
    }

    /**
     * Create an instance of {@link ProfileDataResponse }
     * 
     */
    public ProfileDataResponse createProfileDataResponse() {
        return new ProfileDataResponse();
    }

    /**
     * Create an instance of {@link UpdateLocationsResponse }
     * 
     */
    public UpdateLocationsResponse createUpdateLocationsResponse() {
        return new UpdateLocationsResponse();
    }

    /**
     * Create an instance of {@link SearchHistoryResponse }
     * 
     */
    public SearchHistoryResponse createSearchHistoryResponse() {
        return new SearchHistoryResponse();
    }

    /**
     * Create an instance of {@link ProfileData }
     * 
     */
    public ProfileData createProfileData() {
        return new ProfileData();
    }

    /**
     * Create an instance of {@link RetrieveDriversResponse }
     * 
     */
    public RetrieveDriversResponse createRetrieveDriversResponse() {
        return new RetrieveDriversResponse();
    }

    /**
     * Create an instance of {@link SearchCustomerName }
     * 
     */
    public SearchCustomerName createSearchCustomerName() {
        return new SearchCustomerName();
    }

    /**
     * Create an instance of {@link SearchCustomerNameResponse }
     * 
     */
    public SearchCustomerNameResponse createSearchCustomerNameResponse() {
        return new SearchCustomerNameResponse();
    }

    /**
     * Create an instance of {@link Validate }
     * 
     */
    public Validate createValidate() {
        return new Validate();
    }

    /**
     * Create an instance of {@link DataOrder }
     * 
     */
    public DataOrder createDataOrder() {
        return new DataOrder();
    }

    /**
     * Create an instance of {@link DataDriver }
     * 
     */
    public DataDriver createDataDriver() {
        return new DataDriver();
    }

    /**
     * Create an instance of {@link DataHistory }
     * 
     */
    public DataHistory createDataHistory() {
        return new DataHistory();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveOrderResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "saveOrderResponse")
    public JAXBElement<SaveOrderResponse> createSaveOrderResponse(SaveOrderResponse value) {
        return new JAXBElement<SaveOrderResponse>(_SaveOrderResponse_QNAME, SaveOrderResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateTabel }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "update_tabel")
    public JAXBElement<UpdateTabel> createUpdateTabel(UpdateTabel value) {
        return new JAXBElement<UpdateTabel>(_UpdateTabel_QNAME, UpdateTabel.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchHistory }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "search_history")
    public JAXBElement<SearchHistory> createSearchHistory(SearchHistory value) {
        return new JAXBElement<SearchHistory>(_SearchHistory_QNAME, SearchHistory.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RetrieveDriverRating }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "retrieveDriverRating")
    public JAXBElement<RetrieveDriverRating> createRetrieveDriverRating(RetrieveDriverRating value) {
        return new JAXBElement<RetrieveDriverRating>(_RetrieveDriverRating_QNAME, RetrieveDriverRating.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ValidateResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "validateResponse")
    public JAXBElement<ValidateResponse> createValidateResponse(ValidateResponse value) {
        return new JAXBElement<ValidateResponse>(_ValidateResponse_QNAME, ValidateResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RetrieveDrivers }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "retrieveDrivers")
    public JAXBElement<RetrieveDrivers> createRetrieveDrivers(RetrieveDrivers value) {
        return new JAXBElement<RetrieveDrivers>(_RetrieveDrivers_QNAME, RetrieveDrivers.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateLocations }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "update_locations")
    public JAXBElement<UpdateLocations> createUpdateLocations(UpdateLocations value) {
        return new JAXBElement<UpdateLocations>(_UpdateLocations_QNAME, UpdateLocations.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RetrieveDriverRatingResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "retrieveDriverRatingResponse")
    public JAXBElement<RetrieveDriverRatingResponse> createRetrieveDriverRatingResponse(RetrieveDriverRatingResponse value) {
        return new JAXBElement<RetrieveDriverRatingResponse>(_RetrieveDriverRatingResponse_QNAME, RetrieveDriverRatingResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveOrder }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "saveOrder")
    public JAXBElement<SaveOrder> createSaveOrder(SaveOrder value) {
        return new JAXBElement<SaveOrder>(_SaveOrder_QNAME, SaveOrder.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ProfileData }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "profileData")
    public JAXBElement<ProfileData> createProfileData(ProfileData value) {
        return new JAXBElement<ProfileData>(_ProfileData_QNAME, ProfileData.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RetrieveDriversResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "retrieveDriversResponse")
    public JAXBElement<RetrieveDriversResponse> createRetrieveDriversResponse(RetrieveDriversResponse value) {
        return new JAXBElement<RetrieveDriversResponse>(_RetrieveDriversResponse_QNAME, RetrieveDriversResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchCustomerName }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "search_customer_name")
    public JAXBElement<SearchCustomerName> createSearchCustomerName(SearchCustomerName value) {
        return new JAXBElement<SearchCustomerName>(_SearchCustomerName_QNAME, SearchCustomerName.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchCustomerNameResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "search_customer_nameResponse")
    public JAXBElement<SearchCustomerNameResponse> createSearchCustomerNameResponse(SearchCustomerNameResponse value) {
        return new JAXBElement<SearchCustomerNameResponse>(_SearchCustomerNameResponse_QNAME, SearchCustomerNameResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Validate }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "validate")
    public JAXBElement<Validate> createValidate(Validate value) {
        return new JAXBElement<Validate>(_Validate_QNAME, Validate.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateTabelResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "update_tabelResponse")
    public JAXBElement<UpdateTabelResponse> createUpdateTabelResponse(UpdateTabelResponse value) {
        return new JAXBElement<UpdateTabelResponse>(_UpdateTabelResponse_QNAME, UpdateTabelResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ProfileDataResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "profileDataResponse")
    public JAXBElement<ProfileDataResponse> createProfileDataResponse(ProfileDataResponse value) {
        return new JAXBElement<ProfileDataResponse>(_ProfileDataResponse_QNAME, ProfileDataResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateLocationsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "update_locationsResponse")
    public JAXBElement<UpdateLocationsResponse> createUpdateLocationsResponse(UpdateLocationsResponse value) {
        return new JAXBElement<UpdateLocationsResponse>(_UpdateLocationsResponse_QNAME, UpdateLocationsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchHistoryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Service/", name = "search_historyResponse")
    public JAXBElement<SearchHistoryResponse> createSearchHistoryResponse(SearchHistoryResponse value) {
        return new JAXBElement<SearchHistoryResponse>(_SearchHistoryResponse_QNAME, SearchHistoryResponse.class, null, value);
    }

}
