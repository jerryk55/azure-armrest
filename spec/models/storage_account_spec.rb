########################################################################
# storage_account_spec.rb
#
# Test suite for the Azure::Armrest::StorageAccount json model class.
########################################################################
require 'spec_helper'

describe "StorageAccount" do
  before {
    @json = '{
      "name":"vhds",
      "properties":{"etag": "12345"}
    }'
  }

  let(:storage){ Azure::Armrest::StorageAccount.new(@json) }

  context "constructor" do
    it "returns a StorageAccount class as expected" do
      expect(storage).to be_kind_of(Azure::Armrest::StorageAccount)
    end
  end

  context "storage classes" do
    it "defines container and blob classes" do
      expect(Azure::Armrest::StorageAccount::Container)
      expect(Azure::Armrest::StorageAccount::ContainerProperty)
      expect(Azure::Armrest::StorageAccount::Blob)
      expect(Azure::Armrest::StorageAccount::BlobServiceProperty)
      expect(Azure::Armrest::StorageAccount::BlobServiceStat)
      expect(Azure::Armrest::StorageAccount::BlobMetadata)
      expect(Azure::Armrest::StorageAccount::Table)
      expect(Azure::Armrest::StorageAccount::TableData)
      expect(Azure::Armrest::StorageAccount::BlobSnapshot)
    end
  end

  context "accessors" do
    it "defines a storage_api_version accessor that defaults to 2016-05-31" do
      expect(storage).to respond_to(:storage_api_version)
      expect(storage.storage_api_version).to eq('2016-05-31')
    end

    it "defines a proxy accessor that defaults to the http_proxy environment variable" do
      proxy = "http://www.somewebsiteyyyyzzzz.com/bogusproxy"
      allow(ENV).to receive(:[]).with('http_proxy').and_return(proxy)

      expect(storage).to respond_to(:proxy)
      expect(storage.proxy).to eq(proxy)
    end

    it "defines an ssl_version accessor that defaults to TLSv1" do
      expect(storage).to respond_to(:ssl_version)
      expect(storage.ssl_version).to eq('TLSv1')
    end

    it "defines an ssl_verify accessor that defaults to nil" do
      expect(storage).to respond_to(:ssl_verify)
      expect(storage.ssl_verify).to be_nil
    end

    it "defines an access_key accessor that defaults to nil" do
      expect(storage).to respond_to(:access_key)
      expect(storage.access_key).to be_nil
    end
  end

  context "files and directories" do
    it "defines a create_directory method" do
      expect(storage).to respond_to(:create_directory)
    end

    it "defines a delete_directory method" do
      expect(storage).to respond_to(:delete_directory)
    end

    it "defines a directory_properties method" do
      expect(storage).to respond_to(:directory_properties)
    end

    it "defines a directory_metadata method" do
      expect(storage).to respond_to(:directory_metadata)
    end

    it "defines a files method" do
      expect(storage).to respond_to(:files)
    end

    it "defines a file_content method" do
      expect(storage).to respond_to(:file_content)
    end

    it "defines a file_properties method" do
      expect(storage).to respond_to(:file_properties)
    end

    it "defines a create_file method" do
      expect(storage).to respond_to(:create_file)
    end

    it "defines a delete_file method" do
      expect(storage).to respond_to(:delete_file)
    end

    it "defines a copy_file method" do
      expect(storage).to respond_to(:copy_file)
    end

    it "defines a add_file_content method" do
      expect(storage).to respond_to(:add_file_content)
    end
  end

  context "container methods" do
    it "defines a containers method" do
      expect(storage).to respond_to(:containers)
    end

    it "defines a container_properties method" do
      expect(storage).to respond_to(:container_properties)
    end

    it "defines a container_acl method" do
      expect(storage).to respond_to(:container_acl)
    end
  end

  context "blob methods" do
    it "defines a blobs method" do
      expect(storage).to respond_to(:blobs)
    end

    it "defines an all_blobs method" do
      expect(storage).to respond_to(:all_blobs)
    end

    it "allows an optional hash for the all_blobs method" do
      allow(storage).to receive(:containers).with("abc").and_return([])
      expect(storage.all_blobs("abc", 5)).to eql([])
      expect(storage.all_blobs("abc", 5, :maxresults => 5)).to eql([])
    end

    it "defines a blob_properties method" do
      expect(storage).to respond_to(:blob_properties)
    end

    it "defines an update_blob_properties method" do
      expect(storage).to respond_to(:update_blob_properties)
    end

    it "defines a blob_service_properties method" do
      expect(storage).to respond_to(:blob_service_properties)
    end

    it "defines a blob_metadata method" do
      expect(storage).to respond_to(:blob_metadata)
    end

    it "defines a blob_service_stats method" do
      expect(storage).to respond_to(:blob_service_stats)
    end

    it "defines a copy_blob method" do
      expect(storage).to respond_to(:copy_blob)
    end

    it "defines a create_blob method" do
      expect(storage).to respond_to(:create_blob)
    end

    it "defines a delete_blob method" do
      expect(storage).to respond_to(:delete_blob)
    end

    it "defines a create_blob_snapshot method" do
      expect(storage).to respond_to(:create_blob_snapshot)
    end

    it "defines a get_blob_raw method" do
      expect(storage).to respond_to(:get_blob_raw)
    end
  end

  context "table methods" do
    it "defines a tables method" do
      expect(storage).to respond_to(:tables)
    end

    it "defines a table_info method" do
      expect(storage).to respond_to(:table_info)
    end

    it "defines a table_data method" do
      expect(storage).to respond_to(:table_data)
    end
  end
end
